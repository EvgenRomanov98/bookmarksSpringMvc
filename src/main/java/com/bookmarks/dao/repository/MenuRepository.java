package com.bookmarks.dao.repository;

import com.bookmarks.dao.model.Menu;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface MenuRepository extends JpaRepository<Menu, Long> {


    public Menu findByNameMenu(String nameMenu);
}
