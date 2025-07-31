document.addEventListener("DOMContentLoaded", function () {
  const input = document.getElementById("password");
  const showIcon = document.getElementById("show-icon");
  const hideIcon = document.getElementById("hide-icon");

  function updateFilledState() {
    if (input) {
      input.classList.toggle("filled", input.value.trim() !== "");
      
      // FORZAR la visibilidad correcta de los iconos después de actualizar el estado filled
      maintainIconVisibility();
    }
  }

  function maintainIconVisibility() {
    if (input && showIcon && hideIcon) {
      const isPassword = input.type === "password";
      
      if (isPassword) {
        // Mostrar contraseña -> mostrar icono "show", ocultar icono "hide"
        showIcon.style.display = "block";
        showIcon.style.visibility = "visible";
        showIcon.style.opacity = "1";
        
        hideIcon.style.display = "none";
        hideIcon.style.visibility = "hidden";
        hideIcon.style.opacity = "0";
      } else {
        // Ocultar contraseña -> mostrar icono "hide", ocultar icono "show"
        showIcon.style.display = "none";
        showIcon.style.visibility = "hidden";
        showIcon.style.opacity = "0";
        
        hideIcon.style.display = "block";
        hideIcon.style.visibility = "visible";
        hideIcon.style.opacity = "1";
      }
    }
  }

  if (input && showIcon && hideIcon) {
    const toggleVisibility = () => {
      const isPassword = input.type === "password";
      input.type = isPassword ? "text" : "password";
      
      // Mantener la visibilidad correcta de los iconos
      maintainIconVisibility();
    };

    // Estado inicial
    maintainIconVisibility();

    // Event listeners para el toggle
    showIcon.addEventListener("click", toggleVisibility);
    hideIcon.addEventListener("click", toggleVisibility);
  }

  // Manejar el estado "filled"
  if (input) {
    input.addEventListener("blur", updateFilledState);
    input.addEventListener("input", updateFilledState);
    
    // También mantener los iconos visibles en cada evento
    input.addEventListener("input", function() {
      // Usar setTimeout para asegurar que se ejecute después de cualquier CSS
      setTimeout(maintainIconVisibility, 0);
    });
    
    updateFilledState();
  }
});

// Código temporal para debuggear 
document.addEventListener("DOMContentLoaded", function () {
  const input = document.getElementById("password");
  const showIcon = document.getElementById("show-icon");
  const hideIcon = document.getElementById("hide-icon");

  function debugIconVisibility() {
    console.log("=== DEBUG ICONS ===");
    console.log("Input type:", input?.type);
    console.log("Input value:", input?.value);
    console.log("Input classes:", input?.className);
    
    if (showIcon) {
      const showStyles = window.getComputedStyle(showIcon);
      console.log("Show icon display:", showStyles.display);
      console.log("Show icon visibility:", showStyles.visibility);
      console.log("Show icon opacity:", showStyles.opacity);
      console.log("Show icon inline style:", showIcon.style.cssText);
    }
    
    if (hideIcon) {
      const hideStyles = window.getComputedStyle(hideIcon);
      console.log("Hide icon display:", hideStyles.display);
      console.log("Hide icon visibility:", hideStyles.visibility);
      console.log("Hide icon opacity:", hideStyles.opacity);
      console.log("Hide icon inline style:", hideIcon.style.cssText);
    }
    console.log("==================");
  }

  if (input) {
    input.addEventListener("input", function() {
      console.log("Input event triggered");
      setTimeout(debugIconVisibility, 100);
    });
    
    // Debug inicial
    setTimeout(debugIconVisibility, 1000);
  }
});