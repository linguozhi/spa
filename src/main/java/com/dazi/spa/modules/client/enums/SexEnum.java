package com.dazi.spa.modules.client.enums;

/**
 * @author : linguozhi@52tt.com
 * @desc :
 * @date :  2016/12/24
 */
public enum SexEnum {
    FEMAILE(0, "女"),
    MAN(1, "男"),
    OTHER(2, "其他");


    private Integer index;
    private String value;

    SexEnum(Integer index, String value) {
        this.index = index;
        this.value = value;
    }

    public static SexEnum get(Integer index) {
        for (SexEnum s : SexEnum.values()) {
            if (s.getIndex().equals(index)) {
                return s;
            }
        }

        return FEMAILE;
    }
    public Integer getIndex() {
        return index;
    }

    public void setIndex(Integer index) {
        this.index = index;
    }

    public String getValue() {
        return value;
    }

    public void setValue(String value) {
        this.value = value;
    }
}
