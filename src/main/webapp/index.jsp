<%@ page contentType="text/html;charset=UTF-8" %>

<!DOCTYPE html>
<html lang="es">

<head>

<meta charset="UTF-8">

<meta name="viewport"
      content="width=device-width, initial-scale=1">

<title>Modern WebApp Dashboard</title>

<link
    href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
    rel="stylesheet">

<link
    href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css"
    rel="stylesheet">

<style>

body{
    background:#f5f7fb;
    font-family:Segoe UI, Arial, sans-serif;
}

.hero{
    background:linear-gradient(
        135deg,
        #2563eb,
        #7c3aed
    );
    color:white;
    border-radius:24px;
    padding:50px;
    box-shadow:0 15px 40px rgba(0,0,0,0.15);
}

.dashboard-card{
    border:none;
    border-radius:20px;
    box-shadow:0 10px 25px rgba(0,0,0,0.08);
    transition:all 0.3s ease;
}

.dashboard-card:hover{
    transform:translateY(-5px);
}

.metric{
    font-size:1.8rem;
    font-weight:700;
    color:#0d6efd;
}

.uuid-box{
    font-family:Consolas, monospace;
    word-break:break-all;
    background:#f8f9fa;
    padding:15px;
    border-radius:10px;
}

.footer{
    text-align:center;
    margin-top:40px;
    color:#666;
}

</style>

</head>

<body>

<div class="container py-5">

    <div class="hero mb-5">

        <h1 class="display-5 fw-bold">
            <i class="bi bi-cpu-fill"></i>
            Modern WebApp Dashboard
        </h1>

        <p class="lead mb-0">
            Aplicación Java desplegada sobre Apache Tomcat
        </p>

    </div>

    <div class="row g-4">

        <div class="col-md-3">
            <div class="card dashboard-card h-100">
                <div class="card-body">
                    <h6>
                        <i class="bi bi-cup-hot"></i>
                        Java
                    </h6>
                    <div class="metric">
                        ${javaVersion}
                    </div>
                </div>
            </div>
        </div>

        <div class="col-md-3">
            <div class="card dashboard-card h-100">
                <div class="card-body">
                    <h6>
                        <i class="bi bi-windows"></i>
                        Sistema Operativo
                    </h6>
                    <div class="metric">
                        ${osName}
                    </div>
                </div>
            </div>
        </div>

        <div class="col-md-3">
            <div class="card dashboard-card h-100">
                <div class="card-body">
                    <h6>
                        <i class="bi bi-hdd-network"></i>
                        Hostname
                    </h6>
                    <div>
                        ${hostname}
                    </div>
                </div>
            </div>
        </div>

        <div class="col-md-3">
            <div class="card dashboard-card h-100">
                <div class="card-body">
                    <h6>
                        <i class="bi bi-memory"></i>
                        JVM
                    </h6>
                    <div class="metric">
                        ${memoryUsed} MB
                    </div>
                    <small>
                        de ${memoryTotal} MB
                    </small>
                </div>
            </div>
        </div>

    </div>

    <div class="row mt-4 g-4">

        <div class="col-lg-6">

            <div class="card dashboard-card h-100">

                <div class="card-body">

                    <h4>
                        <i class="bi bi-clock-history"></i>
                        Hora del Servidor
                    </h4>

                    <hr>

                    <h5>
                        ${serverTime}
                    </h5>

                </div>

            </div>

        </div>

        <div class="col-lg-6">

            <div class="card dashboard-card h-100">

                <div class="card-body">

                    <h4>
                        <i class="bi bi-fingerprint"></i>
                        UUID generado por Java
                    </h4>

                    <hr>

                    <div class="uuid-box">
                        ${uuid}
                    </div>

                    <div class="mt-3">
                        
                            Generar otro UUID
                        </a>
                    </div>

                </div>

            </div>

        </div>

    </div>

    <div class="card dashboard-card mt-4">

        <div class="card-body">

            <h4>
                <i class="bi bi-calculator"></i>
                Calculadora Java
            </h4>

            <p class="text-muted">
                La suma se ejecuta en el servidor mediante código Java.
            </p>

            <form method="get">

                <div class="row">

                    <div class="col-md-4">
                        <input
                            type="number"
                            name="num1"
                            class="form-control"
                            placeholder="Primer número"
                            required>
                    </div>

                    <div class="col-md-4">
                        <input
                            type="number"
                            name="num2"
                            class="form-control"
                            placeholder="Segundo número"
                            required>
                    </div>

                    <div class="col-md-4">
                        <button
                            type="submit"
                            class="btn btn-success w-100">

                            Calcular

                        </button>
                    </div>

                </div>

            </form>

            <% if(request.getAttribute("calculationResult") != null){ %>

                <div class="alert alert-success mt-4">

                    Resultado:

                    <strong>
                        <%= request.getAttribute("calculationResult") %>
                    </strong>

                </div>

            <% } %>

            <% if(request.getAttribute("calculationError") != null){ %>

                <div class="alert alert-danger mt-4">

                    <%= request.getAttribute("calculationError") %>

                </div>

            <% } %>

        </div>

    </div>

    <div class="alert alert-success mt-4">

        <strong>
            Estado:
        </strong>

        Aplicación funcionando correctamente sobre
        Apache Tomcat
