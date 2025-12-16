package com.lugx.gamingHouse.controller.admin;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;

import com.lugx.gamingHouse.domain.Product;
import com.lugx.gamingHouse.services.ProductService;
import com.lugx.gamingHouse.services.UploadService;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class ProductController {
    private final ProductService productService;
    private final UploadService uploadService;

    public ProductController(ProductService productService, UploadService uploadService) {
        this.productService = productService;
        this.uploadService = uploadService;
    }

    // show
    @RequestMapping("/admin/product")
    public String getProductPage(Model model, @RequestParam(value = "page", defaultValue = "1") int page) {
        Pageable pageable = PageRequest.of(page - 1, 5);
        Page<Product> products = this.productService.getAllProducts(pageable);
        List<Product> lstproducts = products.getContent();
        model.addAttribute("pro", lstproducts);

        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", products.getTotalPages());

        return "admin/product/show";
    }

    // create
    @GetMapping("/admin/product/create")
    public String getCreateProductPage(Model model) {
        model.addAttribute("newProduct", new Product());
        return "admin/product/create";
    }

    @PostMapping(value = "/admin/product/create")
    public String createProductPage(Model model,
            @ModelAttribute("newProduct") Product itemGame,
            BindingResult newProductbindingResult,
            @RequestParam("nameFile") MultipartFile file) {
        // List<FieldError> errors = newProductbindingResult.getFieldErrors();
        // for (FieldError error : errors) {
        // System.out.println(error.getField() + " - " + error.getDefaultMessage());
        // }
        // Validate
        if (newProductbindingResult.hasErrors()) {
            return "/admin/product/update";
        }
        String picture = this.uploadService.handleSaveUploadFile(file, "product");

        itemGame.setImage(picture);

        this.productService.handleSaveProduct(itemGame);

        return "redirect:/admin/product";
    }

    @RequestMapping("/admin/product/{id}")
    public String getProductDetailPage(Model model, @PathVariable long id) {
        Product pid = this.productService.getProductById(id);
        model.addAttribute("productid", pid);
        return "admin/product/detail";
    }

    @RequestMapping("/admin/product/update/{id}")
    public String getUpdateProductPage(Model model, @PathVariable long id) {
        Product curProduct = this.productService.getProductById(id);
        model.addAttribute("newPro", curProduct);
        return "admin/product/update";
    }

    @PostMapping("/admin/product/update")
    public String postUpdateProductPage(Model model,
            @ModelAttribute("newPro") Product pro,
            @RequestParam("nameFile") MultipartFile file) {

        Product curPro = this.productService.getProductById(pro.getId());
        if (curPro != null) {
            curPro.setName(pro.getName());
            curPro.setPrice(pro.getPrice());
            curPro.setDetailDesc(pro.getDetailDesc());
            curPro.setShortDesc(pro.getShortDesc());
            curPro.setCategory(pro.getCategory());
            curPro.setDiscount(pro.getDiscount());

            if (file != null && !file.isEmpty()) {
                String fileName = this.uploadService.handleSaveUploadFile(file, "product");
                curPro.setImage(fileName);
            }

            this.productService.handleSaveProduct(curPro);
        }
        return "redirect:/admin/product";
    }

    @GetMapping("/admin/product/delete/{id}")
    public String getDeleteProductPage(Model model, @PathVariable long id) {
        model.addAttribute("id", id);
        model.addAttribute("newProduct", new Product());
        return "admin/product/delete";
    }

    @PostMapping("/admin/product/delete")
    public String postDeleteProduct(Model model, @ModelAttribute("newProduct") Product nhat) {
        this.productService.deleteProduct(nhat.getId());
        return "redirect:/admin/product";
    }

}
