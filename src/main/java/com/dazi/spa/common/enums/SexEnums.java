package com.dazi.spa.common.enums;

/**
 * @desc: 性别
 * @author:linguozhi@52tt.com
 * @date: 2016/10/25
 */
public enum  SexEnums {
    OTHER(0, "未知"), MAN(1, "男"), FEMALE(2, "女");
    private final Integer index;
    private final String value;

    SexEnums(Integer index, String value) {
        this.index = index;
        this.value = value;
    }

    public Integer getIndex() {
        return index;
    }

    public String getValue() {
        return value;
    }

    public static SexEnums get(Integer index) {
        for (SexEnums e : SexEnums.values()) {
            if(e.getIndex() == index) {
                return e;
            }
        }

        return SexEnums.OTHER;
    }
}


