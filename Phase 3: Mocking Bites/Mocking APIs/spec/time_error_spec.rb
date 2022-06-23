require "time_error"

describe TimeError do
    it "returns difference between server time and computer time" do
        requester = double(:fake_requester)
        expect(requester).to receive(:get).with(URI("https://worldtimeapi.org/api/ip")).and_return('{"abbreviation":"BST","client_ip":"2a02:6b64:216d:0:edf5:b52e:a7f:db72","datetime":"2022-06-23T13:36:28.133796+01:00","day_of_week":4,"day_of_year":174,"dst":true,"dst_from":"2022-03-27T01:00:00+00:00","dst_offset":3600,"dst_until":"2022-10-30T01:00:00+00:00","raw_offset":0,"timezone":"Europe/London","unixtime":1655987788,"utc_datetime":"2022-06-23T12:36:28.133796+00:00","utc_offset":"+01:00","week_number":25}')
        time = Time.new(2022, 6, 23, 13, 36, 28)
        time_error = TimeError.new(requester, time)
        expect(time_error.error).to eq 0.133796
    end 
end