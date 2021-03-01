package com.curieux.demo.controller;

import com.curieux.demo.model.Person;
import com.curieux.demo.repositories.PersonRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/app")
public class LoginController {

    @Autowired
    private PersonRepository personRepository;

    @PostMapping("/new")
    public String addPerson(@RequestBody Person person) {
        personRepository.saveAndFlush(person);
        return "User added successfully!";
    }

   /* @PostMapping("/login")
    public String validateLogin(@RequestParam String username, @RequestParam String password) {
        List<Person> personList = personRepository.findAll();
        for (Person p: personList) {
            if (p.getUsername().equals(username)) {
                if (p.getPassword().equals(password)) {
                    return "Login Successful!";
                }
            }
        }
        return "User not found";
    }*/

    @PostMapping("/login")
    public void validateLogin(@ModelAttribute Person person) {
        System.out.println("Inside the function");
        System.out.println(person.getUsername());
        System.out.println(person.toString());
    }

}
