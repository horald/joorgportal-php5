	function updatefunc()
	{
		var einkaufsliste = form2object('updateForm', '.', true,
				function(node)
				{
					if (node.id && node.id.match(/callbackTest/))
					{
						return { name: node.id, value: node.innerHTML };
					}
				});

                localStorage.setItem('einkaufsliste', JSON.stringify(einkaufsliste));
		document.getElementById('showdata').innerHTML = JSON.stringify(einkaufsliste, null, '\t');
	}
