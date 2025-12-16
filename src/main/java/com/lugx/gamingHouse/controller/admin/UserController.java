package com.lugx.gamingHouse.controller.admin;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.lugx.gamingHouse.domain.User;
import com.lugx.gamingHouse.services.UploadService;
import com.lugx.gamingHouse.services.UserService;

import jakarta.validation.Valid;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class UserController {

    private final UserService userService;
    private final UploadService uploadService;
    private final PasswordEncoder passwordEncoder;

    public UserController(UserService userService, UploadService uploadService,
            PasswordEncoder passwordEncoder) {
        this.userService = userService;
        this.uploadService = uploadService;
        this.passwordEncoder = passwordEncoder;
    }

    @RequestMapping("/admin/user")
    public String getUserPage(Model model, @RequestParam(value = "page", defaultValue = "1") int page) {
        Pageable pageable = PageRequest.of(page - 1, 5);
        Page<User> users = this.userService.getAllUsers(pageable);
        List<User> lstUsers = users.getContent();
        model.addAttribute("users1", lstUsers);

        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", users.getTotalPages());
        return "admin/user/show";
    }

    @RequestMapping("/admin/user/{id}")
    public String getUserDetailPage(Model model, @PathVariable long id) {
        User uid = this.userService.getUserById(id);
        model.addAttribute("Userid", uid);
        return "admin/user/detail";
    }

    @RequestMapping("/admin/user/update/{id}")
    public String getUpdateUserPage(Model model, @PathVariable long id) {
        User curUser = this.userService.getUserById(id);
        model.addAttribute("newUser", curUser);
        return "admin/user/update";
    }

    @GetMapping("/admin/user/create")
    public String getCreateUserPage(Model model) {
        model.addAttribute("newUser", new User());
        return "admin/user/create";
    }

    @PostMapping("/admin/user/create")
    public String createUserPage(
            Model model,
            @ModelAttribute("newUser") @Valid User user,
            BindingResult bindingResult,
            @RequestParam("nameFile") MultipartFile file) {

        // Validate lỗi từ Bean
        if (bindingResult.hasErrors()) {
            return "/admin/user/create";
        }

        // Validate email trùng
        if (userService.emailExists(user.getEmail())) {
            bindingResult.rejectValue("email", "error.user", "Email đã tồn tại!");
            return "/admin/user/create";
        }

        // Upload Avatar
        String avatar = uploadService.handleSaveUploadFile(file, "avatar");
        user.setAvatar(avatar);

        // Hash password
        user.setPassword(passwordEncoder.encode(user.getPassword()));

        // Gán role ID đúng từ DB
        user.setRole(userService.getRoleByName(user.getRole().getName()));

        userService.handleSaveUser(user);

        return "redirect:/admin/user";
    }

    @PostMapping("/admin/user/update")
    public String postUpdateUserPage(Model model, @ModelAttribute("newUser") User kin,@RequestParam("nameFile") MultipartFile file) {
        User curUser = this.userService.getUserById(kin.getId());
        if (curUser != null) {
            curUser.setAddress(kin.getAddress());
            curUser.setFullName(kin.getFullName());
            curUser.setPhone(kin.getPhone());

            // Preserve old values
            kin.setEmail(curUser.getEmail());
            kin.setPassword(curUser.getPassword());

            if(file != null && !file.isEmpty()){
                String fileName = this.uploadService.handleSaveUploadFile(file, "avatar");
                curUser.setAvatar(fileName);
            }

            this.userService.handleSaveUser(curUser);
        }
        return "redirect:/admin/user";
    }

    @GetMapping("/admin/user/delete/{id}")
    public String getDeleteUserPage(Model model, @PathVariable long id) {
        model.addAttribute("id", id);
        model.addAttribute("newUser", new User());
        return "admin/user/delete";
    }

    @PostMapping("/admin/user/delete")
    public String postDeleteUser(Model model, @ModelAttribute("newUser") User nhat) {
        this.userService.deleteAUser(nhat.getId());
        return "redirect:/admin/user";
    }

}
