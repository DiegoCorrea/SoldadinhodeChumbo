var $gatilhoMenu = document.querySelector('[data-js="gatilhoMenu"]');

$gatilhoMenu.addEventListener( 'click', function(){
	var $menu = document.querySelector('[data-js="menuResponsive"]');
		if ( $menu.style.left == '0' || $menu.style.left == '0rem'){
			$menu.style.left = '-10rem';
		}			
		else{
			$menu.style.left = '0rem';
		}			
}, false );
