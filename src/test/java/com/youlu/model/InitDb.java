package com.youlu.model;


import lombok.Data;

import java.util.List;

@Data
public class InitDb {
    private String dbName;
    private List<InitDb> tables;
}
