document.addEventListener("DOMContentLoaded", function () {
  const input = document.getElementById("password");
  const showIcon = document.getElementById("show-icon");
  const hideIcon = document.getElementById("hide-icon");

  function updateFilledState() {
    if (input) {
      input.classList.toggle("filled", input.value.trim() !== "");
    }
  }

  if (input && showIcon && hideIcon) {
    const toggleVisibility = () => {
      const isPassword = input.type === "password";
      input.type = isPassword ? "text" : "password";
      showIcon.style.display = isPassword ? "none" : "block";
      hideIcon.style.display = isPassword ? "block" : "none";
    };

    // Mostrar sólo el ícono de mostrar al inicio
    showIcon.style.display = "block";
    hideIcon.style.display = "none";

    showIcon.addEventListener("click", toggleVisibility);
    hideIcon.addEventListener("click", toggleVisibility);
  }

  if (input) {
    input.addEventListener("blur", updateFilledState);
    input.addEventListener("input", updateFilledState);
    updateFilledState();
  }
});