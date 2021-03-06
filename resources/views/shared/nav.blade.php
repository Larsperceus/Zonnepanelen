<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <a class="navbar-brand" href="/">Zonnepanelen</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">

        <ul class="navbar-nav ml-auto">

            @auth
                <?php
                    $user = \App\User::findOrFail(auth()->id())
                ?>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#!" data-toggle="dropdown">
                        <i class="fas fa-address-card"></i> {{ auth()->user()->name }} <span class="caret"></span>
                    </a>
                    <div class="dropdown-menu dropdown-menu-right">
                        <a class="dropdown-item" href="dashboard"><i class="fas fa-chart-line"></i> Mijn dashboard</a>
{{--                        <a class="dropdown-item" href="data"><i class="fas fa-database"></i> Data</a>--}}
                        @if(!$user->set)
                            <a class="dropdown-item" href="gegevens"><i class="fas fa-file-signature"></i> Gegevens</a>
                        @else
                            <a class="dropdown-item" href="weer"><i class="fas fa-temperature-high"></i> Weersverwachtingen</a>
                            <a class="dropdown-item" href="edit"><i class="fas fa-user-edit"></i> Gebruiker aanpassen</a>
                        @endif
                        <div class="dropdown-divider"></div>
                        <form action="/logout" method="post">
                            @csrf
                            <button type="submit" class="dropdown-item"><i class="fas fa-sign-out-alt"></i>Logout</button>
                        </form>

                    </div>
                </li>
            @endauth
        </ul>


        @guest
            <ul class="navbar-nav ml-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="/login"><i class="fas fa-sign-in-alt"></i>Login</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/register"><i class="fas fa-signature"></i>Register</a>
                    </li>
            </ul>
        @endguest

    </div>
</nav>
