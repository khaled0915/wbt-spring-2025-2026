<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Login &mdash; Pharmacy Management</title>
<link rel="stylesheet" href="style.css">
</head>
<body class="auth-body">

<div class="auth-shell">
    <div class="auth-side">
        <div class="logo-big">&#128138;</div>
        <h1>Pharmacy Management System</h1>
        <p>Manage medicine inventory, staff accounts, and pricing from one clean dashboard.</p>
        <ul class="feature-list">
            <li>&#10003; Admin manages pharmacist accounts</li>
            <li>&#10003; Pharmacists maintain medicine stock</li>
            <li>&#10003; Fast inventory lookup with AJAX search</li>
            <li>&#10003; Secure session-based access</li>
        </ul>
    </div>

    <div class="auth-form-wrap">
        <div class="auth-card">
            <h2>Welcome Back</h2>
            <p class="muted">Sign in to open your pharmacy workspace</p>

            <?php if (!empty($error)): ?>
                <div class="alert alert-error"><?= htmlspecialchars($error) ?></div>
            <?php endif; ?>

            <form method="POST" action="index.php?page=login" class="form" novalidate>
                <div class="field">
                    <label for="username">Username</label>
                    <input type="text" id="username" name="username"
                           value="<?= htmlspecialchars($prefill ?? '') ?>"
                           placeholder="Enter username" required autofocus>
                </div>
                <div class="field">
                    <label for="password">Password</label>
                    <input type="password" id="password" name="password"
                           placeholder="Enter password" required>
                </div>
                <label class="checkbox">
                    <input type="checkbox" name="remember" <?= !empty($prefill) ? 'checked' : '' ?>>
                    <span>Remember me</span>
                </label>
                <button type="submit" class="btn btn-primary btn-block">Sign In</button>
            </form>

            <p class="auth-foot">Need a pharmacist account?
                <a href="index.php?page=register">Register here</a>
            </p>
            <p class="hint"><strong>Default Admin:</strong> admin / admin123</p>
        </div>
    </div>
</div>

</body>
</html>
