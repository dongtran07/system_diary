class SessionsController < ApplicationController
 def destroy
  uri = URI.parse(self.request.referer)
  oot_url = uri.scheme.to_s + '://' + uri.host.to_s + ':' + uri.port.to_s
  RubyCAS::Filter.logout(self, root_url)
 end
end
