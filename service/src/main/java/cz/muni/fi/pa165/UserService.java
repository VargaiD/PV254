package cz.muni.fi.pa165;

import cz.muni.fi.pa165.entity.User;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author Radovan Lapar
 */
@Service
public interface UserService {
    /**
     * Register new user
     * @param user to be created
     * @param password of the user
     */
    void registerUser(User user, String password);

    /**
     * Update user
     * @param user to be updated
     */
    void update(User user);

    /**
     * Remove user
     * @param user to be removed
     */
    void remove(User user);

    /**
     * Find all users
     * @return list of all users
     */
    List<User> findAll();

    /**
     * Find user by id
     * @param id of user
     * @return user with given id or null if no such user found
     */
    User findById(Long id);

    /**
     * Find user by email
     * @param email of user
     * @return user with given email or null if no such user found
     */
    User findByEmail(String email);

    /**
     * Authenticate user
     * @param user to be authenticated
     * @param password of the user (not hashed)
     * @return true if user is successfully authenticated, false otherwise
     */
    boolean authenticate(User user, String password);

    /**
     * Check if given user is admin
     * @param user to be checked
     * @return true if user is admin, false otherwise
     */
    boolean isAdmin(User user);
}
