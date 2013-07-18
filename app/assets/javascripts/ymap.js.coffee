init = -> (myMap = new ymaps.Map("map"
					      center: [59, 49]
					      zoom: 5
					      behaviors: ['default', 'scrollZoom'])
myMap.geoObjects.add(new ymaps.Placemark([58, 49], {
						    iconContent: 'Шереметевский пр-т, 8'
						    balloonContent: 'text'
						    }
						    {
						    preset: 'twirl#redStretchyIcon'
						    balloonMaxWidth: '250'
						    })))
ymaps.ready init