package com.jonaspetrauskas.dev.validator;

import com.jonaspetrauskas.dev.model.ChangePass;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

@Component
public class PassChangeValidator  implements Validator {

    @Override
    public boolean supports(Class<?> aClass) {
        return ChangePass.class.equals(aClass);
    }

    @Override
    public void validate(Object o, Errors errors) {
        ChangePass changePass = (ChangePass) o;

        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "password2", "NotEmpty");
        if (changePass.getPassword2().length() < 8 || changePass.getPassword2().length() > 32) {
            errors.rejectValue("password2", "Size.changepassform.password2");
        }

        ValidationUtils.rejectIfEmptyOrWhitespace(errors,"passwordConfirm2","NotEmpty");
        if (!changePass.getPasswordConfirm2().equals(changePass.getPassword2())) {
            errors.rejectValue("passwordConfirm2", "Diff.changepassform.passwordConfirm2");
        }
    }
}
