# -------------------------------------------- CONFIG #
#
#
# Manual positioning
top = '200px'
left = '10px'
#
#
# Theming
max_width = '400px'
font_color = 'WHITE'
background = 'rgba(#000, .5)'
#
#
# Toggle options
centered = false  # Set to true to easily center the widget on screen
#
#
# CONFIG -------------------------------------------- #

command: 'curl -s "https://unaparolaalgiorno.it/"'

refreshFrequency: 3600000

style: """
  top: #{top}
  left: #{left}
  max-width: #{max_width}
  color: #{font_color}

  .output
    font-weight: 300
    font-size: 16px
    border-radius: 5px
    padding: 15px
    font-family: "Helvetica Neue"
    background-color: #{background}
    border-radius 5px
    
  .word, .part, .example, .example-meaning
    font-size: 16px

  .title
    font-weight: 800
"""

render: (output) -> """
  <div class="output">
    <div class="title"> <img src="italian-word-of-the-day.widget/it-flag.png" height="10"> Italian word of the day!</div>
    <hr>
    <div>
      <strong>Parola</strong>: <span class="word"></span>
    </div>
    <div>
      <strong>Significato</strong>: <span class="part"></span>
    </div>
  </div>
"""

update: (output, domEl) -> 
  dom = $(domEl)

  word = $(output).find('div > div > div > article > div > h2 > a').text()
  meaning = $(output).find('div > div > div > article > div > p.significato').text().replace('Sign','')


  dom.find('.word').html word
  dom.find('.part').html "#{meaning}."

  if centered
    domWidth = dom.width()
    frameWidth = $(window).width()
    dom.css('left',((frameWidth)/2)-(domWidth/2))