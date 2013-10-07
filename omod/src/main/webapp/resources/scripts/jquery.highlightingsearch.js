/*
 * highlightsearch JQuery plugin
 * v 1.0
 *
 * Turns an input field into a highlighting search field.  Items in the target
 * class(es) will be highlighted if their text contains the (case-insensitive)
 * text typed into the search field.  A callback can be defined that will be
 * invoked whenever an item is highlighted, allowing for custom behavior.
 *
 * Usage:
 *   <style type="text/css">
 *   .match { background-color: yellow; }
 *   </style>
 *   <script>
 *   $('#myInput').highlightingsearch({
 *     targetClass: '.link',
 *     highlightClass: 'match',
 *     callback: function(elem, highlightClass) {
 *       console.log(elem.attr('name') + ' was highlighted');
 *     }
 *   });
 *   </script>
 *
 * targetClass can refer to multiple classes separated by commas.  The 
 * highlightClass class will be added/removed from the target element(s)
 * to highlight them, depending on you setting the CSS style for it.
 * The optional callback is given the element (as jQuery element) being
 * highlighted and the class to use for highlighting.
 */
(function( $ ) {

	var methods = {
		init: function(options) {

			// Default settings
	    	var settings = $.extend({
	    		targetClass: null,
	    		highlightClass: 'highlight',
	    		callback: null
	    	}, options);

	    	// Make target element call us on key up or search events and
	    	// highlight text on focus
		    return this.each(function() {
		    	$(this).on('keyup search', function(e) {
		    		methods.doHighlighting(settings.targetClass,
		    			$(this).val(), settings.highlightClass, settings.callback);
		    	})
		    	.on('focus', function() {
		    		$(this).select();
		    	})
		    	.on('mouseup', function(e) {
		    		e.preventDefault(); // avoid defeating select on focus
		    	});
		    });
		},
		highlight: function(elem, highlightClass) {
			elem.addClass(highlightClass);
		},
		doHighlighting: function(context, text, highlightClass, onHighlight) {
			var lowerText = text.toLowerCase();
			$(context).each(function() {
				if (text.length > 0 && $(this).text().toLowerCase().indexOf(lowerText) != -1) {
					$(this).addClass(highlightClass);
					if (onHighlight)
						onHighlight($(this), highlightClass);
				} else {
					$(this).removeClass(highlightClass);
				}
			});
		}
	}

	// Standard jQuery plugin configuration
	$.fn.highlightingsearch = function( methodOrOptions ) {
        if ( methods[methodOrOptions] ) {
            return methods[ methodOrOptions ].apply( this, Array.prototype.slice.call( arguments, 1 ));
        } else if ( typeof methodOrOptions === 'object' || ! methodOrOptions ) {
            return methods.init.apply( this, arguments );
        } else {
            $.error( 'Method ' +  methodOrOptions + ' does not exist on jQuery.highlightingsearch' );
        }    
    };
}( jQuery ));