package com.lugx.gamingHouse.services;

import java.util.List;

import org.springframework.stereotype.Service;

import com.lugx.gamingHouse.domain.User;
import com.lugx.gamingHouse.repository.UserRepository;

@Service
public class UserService {
    private final UserRepository userRepository;

    public UserService(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    // Đăng ký user mới
    public User handleSaveUser(User user) {
        return this.userRepository.save(user);
    }

    public List<User> getAllUsers(){
        return this.userRepository.findAll();
    }

    public User getAllUsersByEmail(String email){
        return this.userRepository.findByEmail(email);
    }

    public User getUserById(long id){
        return this.userRepository.findById(id);
    }

    // deleteByID
    public void deleteUser(long id){
        this.userRepository.deleteById(id);
    }
}