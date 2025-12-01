<div class="d-flex" id="layoutSidenav" style="height: 100vh;">
  <!-- Sidebar -->
  <nav class="bg-dark text-white" style="width: 250px;">
    <div class="p-3 d-flex flex-column h-100">
      <h5 class="text-white mb-4">FEATURES</h5>
      <ul class="nav flex-column mb-auto">
        <li class="nav-item">
          <a class="nav-link text-white" href="/admin"><i class="fas fa-home"></i> Dashboard</a>
        </li>
        <li class="nav-item">
          <a class="nav-link text-white" href="/admin/user"><i class="fas fa-users"></i> Users</a>
        </li>
        <li class="nav-item">
          <a class="nav-link text-white" href="/admin/product"><i class="fas fa-box"></i> Products</a>
        </li>
        <li class="nav-item">
          <a class="nav-link text-white" href="/admin/order"><i class="fas fa-shopping-cart"></i> Orders</a>
        </li>
      </ul>
      <div class="mt-auto pt-3 border-top">
        <div class="small">Logged in as:</div>
        ${sessionScope.fullName}
      </div>
    </div>
  </nav>

  <!-- Main Content -->
  <div class="flex-grow-1" style="overflow-y: auto;">
    <!-- Nội dung chính sẽ được chèn vào đây -->