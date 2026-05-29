document.addEventListener("DOMContentLoaded", function () {
  const input = document.getElementById("password");
  const showIcon = document.getElementById("show-icon");
  const hideIcon = document.getElementById("hide-icon");

  function updateFilledState() {
    if (input) {
      input.classList.toggle("filled", input.value.trim() !== "");
      // Mantener iconos visibles después de actualizar estado
      maintainIconVisibility();
    }
  }

  function maintainIconVisibility() {
    if (input && showIcon && hideIcon) {
      const isPassword = input.type === "password";
      
      if (isPassword) {
        // Password oculta -> mostrar icono "show"
        showIcon.style.display = "block";
        showIcon.style.visibility = "visible";
        showIcon.style.opacity = "1";
        
        hideIcon.style.display = "none";
        hideIcon.style.visibility = "hidden";
        hideIcon.style.opacity = "0";
      } else {
        // Password visible -> mostrar icono "hide"
        showIcon.style.display = "none";
        showIcon.style.visibility = "hidden";
        showIcon.style.opacity = "0";
        
        hideIcon.style.display = "block";
        hideIcon.style.visibility = "visible";
        hideIcon.style.opacity = "1";
      }
    }
  }

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

  if (input && showIcon && hideIcon) {
    const toggleVisibility = (event) => {
      event.preventDefault();
      event.stopPropagation();
      
      console.log("Toggle clicked, current type:", input.type);
      
      const isPassword = input.type === "password";
      input.type = isPassword ? "text" : "password";
      
      console.log("New type:", input.type);
      
      // Mantener la visibilidad correcta de los iconos
      maintainIconVisibility();
      
      // Debug después del cambio
      setTimeout(debugIconVisibility, 10);
    };

    // Estado inicial
    maintainIconVisibility();

    // Event listeners para el toggle - SOLO UNA VEZ
    showIcon.addEventListener("click", toggleVisibility);
    hideIcon.addEventListener("click", toggleVisibility);
    
    console.log("Event listeners agregados");
  }

  // Manejar el estado "filled"
  if (input) {
    input.addEventListener("blur", updateFilledState);
    input.addEventListener("input", updateFilledState);
    
    // Mantener iconos visibles en cada evento de input
    input.addEventListener("input", function() {
      setTimeout(maintainIconVisibility, 0);
    });
    
    updateFilledState();
  }

  // Debug inicial
  setTimeout(debugIconVisibility, 1000);
});