package com.example.webapp;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.net.InetAddress;
import java.time.LocalDateTime;
import java.util.UUID;

@WebServlet("/")
public class HomeServlet extends HttpServlet {

    @Override
    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        Runtime runtime = Runtime.getRuntime();

        long totalMemory =
                runtime.totalMemory() / (1024 * 1024);

        long freeMemory =
                runtime.freeMemory() / (1024 * 1024);

        long usedMemory =
                totalMemory - freeMemory;

        request.setAttribute(
                "serverTime",
                LocalDateTime.now());

        request.setAttribute(
                "javaVersion",
                System.getProperty("java.version"));

        request.setAttribute(
                "osName",
                System.getProperty("os.name"));

        request.setAttribute(
                "hostname",
                InetAddress.getLocalHost().getHostName());

        request.setAttribute(
                "memoryUsed",
                usedMemory);

        request.setAttribute(
                "memoryTotal",
                totalMemory);

        request.setAttribute(
                "uuid",
                UUID.randomUUID().toString());

        String num1 = request.getParameter("num1");
        String num2 = request.getParameter("num2");

        if (num1 != null && num2 != null) {
            try {
                int a = Integer.parseInt(num1);
                int b = Integer.parseInt(num2);

                request.setAttribute(
                        "calculationResult",
                        a + b);

            } catch (NumberFormatException e) {
                request.setAttribute(
                        "calculationError",
                        "Debe introducir valores numéricos válidos.");
            }
        }

        request.getRequestDispatcher("/index.jsp")
                .forward(request, response);
    }
}
