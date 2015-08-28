# Cookbook Name:: ffmpeg
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
bash 'get_ffmpeg' do
    cwd "/tmp"
    code <<-EOH
    wget http://johnvansickle.com/ffmpeg/releases/ffmpeg-release-64bit-static.tar.xz
    tar xvf ffmpeg-release-64bit-static.tar.xz
    cp $(find ./ -name ffmpeg) /usr/local/bin || 0
    cp $(find ./ -name ffprobe) /usr/local/bin || 0
    EOH
    not_if "test -f /usr/local/bin/ffprobe && test -f /usr/local/bin/ffmpeg"
end