package com.bookmarks.service;

import com.bookmarks.dao.model.Menu;
import com.bookmarks.dao.repository.MenuRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class MenuService {
    @Autowired
    private MenuRepository menuRepository;

    public void save(Menu menu) {
        menuRepository.save(menu);
    }

    public List<Menu> findAll(){
        return menuRepository.findAll();
    }

    public Menu findMenuByNameMenu(String nameMenu){
        return menuRepository.findByNameMenu(nameMenu);
    }
}
