package com.dev0th.capstoneclouddevops.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class CapstoneController {

    @GetMapping("/")
    public String hello() {
        return "Hello World!";
    }
}
