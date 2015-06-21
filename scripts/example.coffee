# Description:
#   <description of the scripts functionality>
#
# Dependencies:
#   "<module name>": "<module version>"
#   ...
#   or `None` (without quotes)
#
# Configuration:
#   ENV_VARIABLE <description>
#   ...
#   or `None` (without quotes)
#
# Commands:
#   hubot <trigger> - <what the respond trigger does>
#   <trigger> - <what the hear trigger does>
#   ...
#
# Notes:
#   <optional notes required for the script>
#
# Author:
#   <github username of the original script author>

module.exports = (robot) ->

  robot.hear /what is HAL 9000[?]/i, (msg) ->
    msg.send "HAL 9000 is a fictional character in Arthur C. Clarke's Space Odyssey series."

  robot.respond /open the (.+)/i, (msg) ->
    msg.reply msg.message.user.name + ', ' + msg.match[1] + ' opened'

  # for more information see https://github.com/github/hubot/blob/master/docs/scripting.md
