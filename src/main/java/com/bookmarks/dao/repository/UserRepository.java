package com.bookmarks.dao.repository;

import com.bookmarks.dao.model.UserInfo;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

/**
 * стандартный JPA репозиторий который работает с объектами.
 */
@Repository
public interface UserRepository extends JpaRepository<UserInfo, Long> {
    UserInfo findByUsername(String username);
}
