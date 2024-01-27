package com.codingdojo.authentication.services;

import java.util.Optional;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;

import com.codingdojo.authentication.models.LoginUser;
import com.codingdojo.authentication.models.User;
import com.codingdojo.authentication.repositories.UserRepository;

@Service
public class UserService {

	@Autowired
	private UserRepository userRepo;
	
    // This method will be called from the controller
    // whenever a user submits a registration form.
	
    public User register(User newUser, BindingResult result) {
    	
    	// TO-DO - Reject values or register if no errors:
        // Reject if email is taken (present in database)
    	Optional<User> potentialUser = userRepo.findByEmail(newUser.getEmail());
    	if (potentialUser.isPresent()) {
    		result.rejectValue("email", "exists", "The email entered is already in use");
    	}
        // Reject if password doesn't match confirmation
        if (!newUser.getPassword().equals(newUser.getConfirm())) {
        	result.rejectValue("confirm", "Matches", "The Confirm Password must match Password!");
        }
        // Return null if result has errors
    	if (result.hasErrors()) {
    		return null;
    	}
        // Hash and set password, save user to database
        String hashPassword = BCrypt.hashpw(newUser.getPassword(), BCrypt.gensalt());
        newUser.setPassword(hashPassword);
        return userRepo.save(newUser);
    }

	
    // This method will be called from the controller
    // whenever a user submits a login form.
        public User login(LoginUser newLogin, BindingResult result) {
        	User user = null;
        // TO-DO - Reject values:
        
    	// Find user in the DB by email
        // Reject if NOT present
        	Optional<User> potentialUser = userRepo.findByEmail(newLogin.getEmail());
        	if (potentialUser.isEmpty()) {
        		result.rejectValue("email", "exists", "There is no user registered under this email");
        	}
        // Reject if BCrypt password match fails
        	else if (!BCrypt.checkpw(newLogin.getPassword(), potentialUser.get().getPassword())){
        		result.rejectValue("password", "matches", "The password is incorrect");
        	}
        	else {
        		user = potentialUser.get();
        	}
        // Return null if result has errors
        	if (result.hasErrors()) {
        		return null;
        	}
        // Otherwise, return the user object
        	return user;
    }
        
        public User getUserById(long userId) {
        	Optional<User> potentialUser = userRepo.findById(userId);
        	if(potentialUser.isPresent()) {
        		return potentialUser.get();
        	}else {
        		return null;
        	}
        }

}
