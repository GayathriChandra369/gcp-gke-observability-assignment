package com.example.appb;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.time.Instant;
import java.util.HashMap;
import java.util.Map;

@RestController
public class AppBController {

    private static final Logger logger = LoggerFactory.getLogger(AppBController.class);

    @GetMapping("/app-b")
    public Map<String, String> appB() {
        logger.info("Request received: GET /app-b");

        String podName = System.getenv().getOrDefault("HOSTNAME", "unknown");
        String clusterName = System.getenv().getOrDefault("CLUSTER_NAME", "unknown");

        logger.info("Processing request on pod: {}, cluster: {}", podName, clusterName);

        Map<String, String> response = new HashMap<>();
        response.put("app", "app-b");
        response.put("message", "Hello from Application B");
        response.put("pod", podName);
        response.put("cluster", clusterName);
        response.put("timestamp", Instant.now().toString());

        return response;
    }

    @GetMapping("/")
    public Map<String, String> home() {
        logger.info("Request received: GET /");
        Map<String, String> response = new HashMap<>();
        response.put("app", "app-b");
        response.put("status", "running");
        response.put("timestamp", Instant.now().toString());
        return response;
    }

    @GetMapping("/app-b/error")
    public Map<String, String> simulateError() {
        logger.error("Simulated error occurred in app-b");

        Map<String, String> response = new HashMap<>();
        response.put("app", "app-b");
        response.put("status", "error");
        response.put("message", "Simulated error for observability testing");
        response.put("timestamp", Instant.now().toString());
        return response;
    }
}
