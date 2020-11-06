package com.bigdeal.controller;

import com.bigdeal.service.EmailService;
import org.apache.commons.lang.exception.ExceptionUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.bigdeal.constants.Consts;
import com.bigdeal.dao.AccountDAO;
import com.bigdeal.dao.CustomerDAO;
import com.bigdeal.entity.Account;
import com.bigdeal.entity.Customers;
import com.bigdeal.form.AccountForm;
import com.bigdeal.form.CustomerForm2;
import com.bigdeal.model.AccountModel;
import com.bigdeal.model.CustomerModel;
import com.bigdeal.pagination.PaginationResult;

@Controller
@Transactional
public class AccountController {

	@Autowired
	private AccountDAO accountDAO;

	@Autowired
    private EmailService emailService;

    private static Logger log = LoggerFactory.getLogger(EmailService.class);

	// Danh sách sản phẩm.
	@RequestMapping(value = Consts.adminPath + "/accounts", method = RequestMethod.GET)
	public String listProductHandler(Model model, //
			@RequestParam(value = "name", defaultValue = "") String likeName,
			@RequestParam(value = "page", defaultValue = "1") int page) {

		PaginationResult<AccountModel> result = accountDAO.query(page, //
				Consts.RESULT_PER_PAGE, Consts.MAX_NAVIGATION_PAGE, likeName);

		model.addAttribute("data", result);
		return "account/index";
	}

//	@RequestMapping(value = { Consts.adminPath + "/customers/image" }, method = RequestMethod.GET)
//	public void productImage(HttpServletRequest request, HttpServletResponse response, Model model,
//			@RequestParam("id") Long id) throws IOException {
//		Customers item = null;
//		if (id != null) {
//			item = this.customerDAO.findById(id);
//		}
//		if (item != null && item.getImage() != null) {
//			response.setContentType("image/jpeg, image/jpg, image/png, image/gif");
//			response.getOutputStream().write(item.getImage());
//		}
//		response.getOutputStream().close();
//	}

	// GET: Hiển thị product
	@RequestMapping(value = Consts.adminPath + "/accounts/edit", method = RequestMethod.GET)
	public String editUser(Model model, @RequestParam(value = "id", defaultValue = "0") String userName) {
		AccountForm form = null;

		if (userName != null) {
			Account item = accountDAO.findById(userName);
			if (item != null) {
				form = new AccountForm(item);
			}
		}
		if (form == null) {
			form = new AccountForm();
			form.setNewMode(true);
		}
		model.addAttribute("form", form);
		return "account/edit";
	}

	// POST: Save product
	@RequestMapping(value = Consts.adminPath + "/accounts/save", method = RequestMethod.POST)
	public String accountSave(Model model, //
			@ModelAttribute("form") @Validated AccountForm form, //
			BindingResult result, //
			final RedirectAttributes redirectAttributes) {

		if (result.hasErrors()) {
			return "account/edit";
		}
		try {
			accountDAO.save(form);
		} catch (Exception e) {
			Throwable rootCause = ExceptionUtils.getRootCause(e);
			String message = rootCause.getMessage();
			model.addAttribute("errorMessage", message);
			// Show product form.
			return "account/edit";
		}

		return "redirect:/admin/accounts";
	}

	@RequestMapping(value = Consts.adminPath + "/accounts/delete", method = RequestMethod.GET)
	public String deleteUser(@RequestParam("id") String id, Model model) {
		accountDAO.delete(id);
		return "redirect:/admin/accounts";
	}

	@GetMapping(value = "/forgot-password")
	public String forgotPassword(@RequestParam(value = "email") String email, @RequestParam(value = "userName") String userName, Model model) {
        try {
            model.addAttribute("email", email);
            model.addAttribute("userName", userName);
            Account account = accountDAO.findAccount(userName);
            if (account != null) {
                AccountForm accountForm = new AccountForm();
                accountForm.setEmail(account.getEmail());
                accountForm.setUserName(account.getUserName());
                accountForm.setPassword(account.getEncrytedPassword());
                accountForm.setUserRole(account.getUserRole());
                if (account.getUserName().equals(userName)) {
//                    String code = emailService.sendEmail(email, userName);
					String code = "1234";
                    log.info("Email sent to " + email);
                    if (code != null) {
                        account.setResetCode(Integer.parseInt(code));
                        accountDAO.save(accountForm);
                        model.addAttribute("success", true);
                        model.addAttribute("message", "Please check your email to reset password!");
                    } else {
                        model.addAttribute("success", false);
                        model.addAttribute("message", "Error when send email. Try again later!");
                    }
                }
            }
			return "/frontend/forgot-password-finish";
        } catch (Exception e) {
            e.printStackTrace();
			return "redirect:/usr/forgot-password";
        }
	}

}
