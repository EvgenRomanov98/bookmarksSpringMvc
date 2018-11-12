package com.bookmarks.dao.model;

import lombok.Data;

import javax.persistence.*;

@Data
@Entity
public class Bookmark {

    @Id
    @GeneratedValue(strategy=GenerationType.AUTO)
    private Long id;
    @Column
    private String link;
    @Column
    private String comment;
    @ManyToOne
    private Menu menu;

    public Bookmark(String comment) {
        this.comment = comment;
    }

    public Bookmark() {
    }

    public Bookmark(String link, String comment, Menu menu) {
        this.link = link;
        this.comment = comment;
        this.menu = menu;
    }
}
