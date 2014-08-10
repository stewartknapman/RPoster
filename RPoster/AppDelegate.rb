#
#  AppDelegate.rb
#  RPoster
#
#  Created by Stewart Knapman on 27/04/13.
#  Copyright 2013 Stewart Knapman. All rights reserved.
#
#  Credit to https://gist.github.com/alloy/885125 by alloy

class AppDelegate
  attr_accessor :window, :url_field, :input_field, :output_field
  attr_reader :response, :responseBody

  def applicationDidFinishLaunching(a_notification)
    # Insert code here to initialize your application
  end

  def post_data(sender)
    # if we have data to send and a place to send it to.
    unless url_field.stringValue.empty? && input_field.string.empty?
      # build request object
      request = NSMutableURLRequest.requestWithURL(NSURL.URLWithString(url_field.stringValue))
      # set post data
      postBody = input_field.string
      request.setHTTPMethod("POST")
      request.setValue("application/xml", forHTTPHeaderField: "Content-Type")
      request.setHTTPBody(postBody.dataUsingEncoding(NSUTF8StringEncoding))
      # make request
      NSURLConnection.connectionWithRequest(request, delegate:self)
    end
  end
  
  def connection(connection, didReceiveResponse:response)
    @response = response
    @downloadData = NSMutableData.data
  end
  
  def connection(connection, didReceiveData:data)
    @downloadData.appendData(data)
  end
  
  def connectionDidFinishLoading(connection)
    @responseBody = NSString.alloc.initWithData(@downloadData, encoding:NSUTF8StringEncoding)
    # display output data
    str = "RESPONSE: #{@response.statusCode}\n"
    str << "DATA: #{@responseBody}"
    output_field.setString(str)
  end
end