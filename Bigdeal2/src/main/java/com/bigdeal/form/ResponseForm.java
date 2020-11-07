package com.bigdeal.form;

public class ResponseForm {

    private int code;
    private Boolean status;
    private String errors;
    private Object data;

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public Boolean getStatus() {
        return status;
    }

    public void setStatus(Boolean status) {
        this.status = status;
    }

    public String getErrors() {
        return errors;
    }

    public void setErrors(String errors) {
        this.errors = errors;
    }

    public Object getData() {
        return data;
    }

    public void setData(Object data) {
        this.data = data;
    }

    public static ResponseForm build(int code, boolean status, String errors, Object data)
    {
        ResponseForm apiResponse = new ResponseForm();
        apiResponse.setCode(code);
        apiResponse.setStatus(status);
        apiResponse.setErrors(errors);
        apiResponse.setData(data);
        return apiResponse;
    }
}
