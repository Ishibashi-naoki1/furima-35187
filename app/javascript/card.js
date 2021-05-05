const pay = () => {
  Payjp.setPublicKey(process.env.PAYJP_PUBLIC_KEY);
  const form = document.getElementById("charge-form");
  form.addEventListener("submit", (e) => {
    e.preventDefault();
   

    const formResult = document.getElementById("charge-form");
    const formData = new FormData(formResult);

    const card = {
      number: formData.get("order_buyer[number]"),
      cvc: formData.get("order_buyer[cvc]"),
      exp_month: formData.get("order_buyer[exp_month]"),
      exp_year: `20${formData.get("order_buyer[exp_year]")}`,
    };
      // console.log(status)

     
    Payjp.createToken(card, (status, response) => {
      if (status == 200) {
        const token = response.id;
        const renderDom = document.getElementById("charge-form");
        const tokenObj = `<input value=${token} name='token' type="hidden"> `;
        renderDom.insertAdjacentHTML("beforeend", tokenObj);
      }

      // VALID_CARD_NUMBER_REGEX = /^\d{14,16}$/                                                                                                                                                                
      // VALID_YAER_REGEX = /^\d{2}$/                                                                                                                                                                           
      // VALID_MONTH_REGEX = /^\d{2}$/                                                                                                                                                                          
      // VALID_CVC_REGEX = /^\d{3,4}$/ 
      

      document.getElementById("card-number").removeAttribute("name");
      document.getElementById("card-cvc").removeAttribute("name");
      document.getElementById("card-exp-month").removeAttribute("name");
      document.getElementById("card-exp-year").removeAttribute("name");

      document.getElementById("charge-form").submit();
    });
  });
};

window.addEventListener("load", pay);