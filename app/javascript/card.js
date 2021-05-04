const pay = () => {
  Payjp.setPublicKey("pk_test_c31241a2b7555b057dc2e221");
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
    // console.log(card)
     
    Payjp.createToken(card, (status, response) => {
      if (status == 200) {
        const token = response.id;
        const renderDom = document.getElementById("charge-form");
        const tokenObj = `<input value=${token} name='token' type="hidden"> `;
        renderDom.insertAdjacentHTML("beforeend", tokenObj);
      }

      document.getElementById("order_buyer_number").removeAttribute("name");
      document.getElementById("order_buyer_cvc").removeAttribute("name");
      document.getElementById("order_buyer_exp_month").removeAttribute("name");
      document.getElementById("order_buyer_exp_year").removeAttribute("name");

      document.getElementById("charge-form").submit();
    });
  });
};

window.addEventListener("load", pay);