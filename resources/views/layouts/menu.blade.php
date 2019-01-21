<nav id="sidebar">
    <div id="main-menu">
        <ul class="sidebar-nav">
            <li class="current">
                <a href="#"><i class="fa fa-dashboard"></i><span class="sidebar-text">Painel de controle</span></a>
            </li>
            <li>
                <a href="#"><i class="fa fa-edit"></i><span class="sidebar-text">Sistema</span><span
                        class="fa arrow"></span></a>
                <ul class="submenu collapse">
                    <li>
                        <a href="#"><span class="sidebar-text">Perfil</span></a>
                    </li>
                    <li>
                        <a href="#"><span class="sidebar-text">Regras</span></a>
                    </li>
                    <li>
                        <a href="{{route('user.list')}}"><span class="sidebar-text">Usuários</span></a>
                    </li>
                    <li>
                        <a href="{{route('client.list')}}"><span class="sidebar-text">Clientes</span></a>
                    </li>
                </ul>
            </li>
            <li>
                <a href="#"><i class="fa fa-edit"></i><span class="sidebar-text">Relatórios</span><span
                        class="fa arrow"></span></a>
                <ul class="submenu collapse">
                    <li>
                        <a href="{{route('report.index')}}"><span class="sidebar-text">Clientes</span></a>
                    </li>
                </ul>
            </li>
            <li>
                <a href="#"><i class="fa fa-pencil"></i><span class="sidebar-text">Opções de Cores</span>
                    <span class="fa arrow"></span></a>
                <ul class="submenu collapse">
                    <li>
                        <a href="#" data-style="dark" class="theme-color"><span class="sidebar-text">Dark Skin</span></a>
                    </li>
                    <li>
                        <a href="#" data-style="light" class="theme-color"><span class="sidebar-text">Light Skin</span></a>
                    </li>
                    <li>
                        <a href="#" data-style="cafe" class="theme-color"><span class="sidebar-text">Cafe Skin</span></a>
                    </li>
                    <li>
                        <a href="#" data-style="blue" class="theme-color"><span class="sidebar-text">Blue Skin</span></a>
                    </li>
                    <li>
                        <a href="#" data-style="red" class="theme-color"><span class="sidebar-text">Red Skin</span></a>
                    </li>
                    <li>
                        <a href="#" data-style="green" class="theme-color"><span class="sidebar-text">Green Skin</span></a>
                    </li>
                </ul>
            </li>
        </ul>
    </div>
</nav>
