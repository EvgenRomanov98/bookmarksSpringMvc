package com.bookmarks.dao.model;

import lombok.Data;

import javax.persistence.*;

@Data
@Entity
public class Bookmark {

    @Id
    @GeneratedValue
    private Long id;
    @Column
    private String link;
    @Column
    private String comment;
    @ManyToOne
    private Menu menu;
}
