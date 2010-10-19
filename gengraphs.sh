#!/bin/sh

set -e

RRDFILE=monitor.rrd

#DIR=~/public_html/2wire
DIR=.
IMAGEFILE1=$DIR/2wire1.png
IMAGEFILE3=$DIR/2wire3.png
IMAGEFILE14=$DIR/2wire14.png
IMAGEFILE30=$DIR/2wire30.png
IMAGEFILE365=$DIR/2wire365.png


LABELTEXT="Cowhouse Bandwidth"
DAYCOLOR="#66aa66"
UPCOLOR="#0000ff"
DOWNCOLOR="#ff0000"


if [ ! -f $RRDFILE ]; then
    echo "Could not access $RRDFILE"
    exit 1
fi



rrdtool graph $IMAGEFILE1 \
    -A -w600 -h480 --imgformat=PNG \
    --title="$LABELTEXT (last 24 hours) ... $(date)" \
    --vertical-label="Bytes/sec" \
    --start="-1 day" \
    --slope-mode \
    --alt-autoscale-max \
    --x-grid MINUTE:15:HOUR:1:HOUR:3:0:"%X" \
    DEF:input=$RRDFILE:input:AVERAGE \
    DEF:output=$RRDFILE:output:AVERAGE \
    LINE1:input$DOWNCOLOR:"download" \
    LINE1:output$UPCOLOR:"upload" \
    VRULE:$(date -v0H -v0M -v0S +%s)$DAYCOLOR \
    COMMENT:"\\l" >/dev/null


rrdtool graph $IMAGEFILE3 \
    -A -w600 -h480 --imgformat=PNG \
    --title="$LABELTEXT (last 3 days) ... $(date)" \
    --vertical-label="Bytes/sec" \
    --start="-3 day" \
    --slope-mode \
    --alt-autoscale-max \
    DEF:input=$RRDFILE:input:AVERAGE \
    DEF:output=$RRDFILE:output:AVERAGE \
    LINE1:input$DOWNCOLOR:"download" \
    LINE1:output$UPCOLOR:"upload" \
    VRULE:$(date -v0H -v0M -v0S +%s)$DAYCOLOR \
    VRULE:$(date -v0H -v0M -v0S -v-1d +%s)$DAYCOLOR \
    VRULE:$(date -v0H -v0M -v0S -v-2d +%s)$DAYCOLOR \
    VRULE:$(date -v0H -v0M -v0S -v-3d +%s)$DAYCOLOR \
    COMMENT:"\\l" >/dev/null



rrdtool graph $IMAGEFILE14 \
    -A -w600 -h480 --imgformat=PNG \
    --title="$LABELTEXT (last 14 days) ... $(date)" \
    --vertical-label="Bytes/sec" \
    --start="-14 day" \
    --slope-mode \
    --alt-autoscale-max \
    --x-grid HOUR:8:DAY:1:DAY:1:0:"%a%d" \
    DEF:input=$RRDFILE:input:AVERAGE \
    DEF:output=$RRDFILE:output:AVERAGE \
    LINE1:input$DOWNCOLOR:"download" \
    LINE1:output$UPCOLOR:"upload" \
    VRULE:$(date -v0H -v0M -v0S +%s)$DAYCOLOR \
    VRULE:$(date -v0H -v0M -v0S -v-1d +%s)$DAYCOLOR \
    VRULE:$(date -v0H -v0M -v0S -v-2d +%s)$DAYCOLOR \
    VRULE:$(date -v0H -v0M -v0S -v-3d +%s)$DAYCOLOR \
    VRULE:$(date -v0H -v0M -v0S -v-4d +%s)$DAYCOLOR \
    VRULE:$(date -v0H -v0M -v0S -v-5d +%s)$DAYCOLOR \
    VRULE:$(date -v0H -v0M -v0S -v-6d +%s)$DAYCOLOR \
    VRULE:$(date -v0H -v0M -v0S -v-7d +%s)$DAYCOLOR \
    VRULE:$(date -v0H -v0M -v0S -v-8d +%s)$DAYCOLOR \
    VRULE:$(date -v0H -v0M -v0S -v-9d +%s)$DAYCOLOR \
    VRULE:$(date -v0H -v0M -v0S -v-10d +%s)$DAYCOLOR \
    VRULE:$(date -v0H -v0M -v0S -v-11d +%s)$DAYCOLOR \
    VRULE:$(date -v0H -v0M -v0S -v-12d +%s)$DAYCOLOR \
    VRULE:$(date -v0H -v0M -v0S -v-13d +%s)$DAYCOLOR \
    VRULE:$(date -v0H -v0M -v0S -v-14d +%s)$DAYCOLOR \
    COMMENT:"\\l" > /dev/null


rrdtool graph $IMAGEFILE30 \
    -A -w640 -h480 --imgformat=PNG \
    --title="$LABELTEXT (last 30 days) ... $(date)" \
    --vertical-label="Bytes/sec" \
    --start="-30 day" \
    --slope-mode \
    --alt-autoscale-max \
    --x-grid DAY:1:WEEK:1:WEEK:1:0:"%D" \
    DEF:input=$RRDFILE:input:AVERAGE \
    DEF:output=$RRDFILE:output:AVERAGE \
    LINE1:input$DOWNCOLOR:"download" \
    LINE1:output$UPCOLOR:"upload" \
    VRULE:$(date -v0H -v0M -v0S +%s)$DAYCOLOR \
    VRULE:$(date -v0H -v0M -v0S -v-1d +%s)$DAYCOLOR \
    VRULE:$(date -v0H -v0M -v0S -v-2d +%s)$DAYCOLOR \
    VRULE:$(date -v0H -v0M -v0S -v-3d +%s)$DAYCOLOR \
    VRULE:$(date -v0H -v0M -v0S -v-4d +%s)$DAYCOLOR \
    VRULE:$(date -v0H -v0M -v0S -v-5d +%s)$DAYCOLOR \
    VRULE:$(date -v0H -v0M -v0S -v-6d +%s)$DAYCOLOR \
    VRULE:$(date -v0H -v0M -v0S -v-7d +%s)$DAYCOLOR \
    VRULE:$(date -v0H -v0M -v0S -v-8d +%s)$DAYCOLOR \
    VRULE:$(date -v0H -v0M -v0S -v-9d +%s)$DAYCOLOR \
    VRULE:$(date -v0H -v0M -v0S -v-10d +%s)$DAYCOLOR \
    VRULE:$(date -v0H -v0M -v0S -v-11d +%s)$DAYCOLOR \
    VRULE:$(date -v0H -v0M -v0S -v-12d +%s)$DAYCOLOR \
    VRULE:$(date -v0H -v0M -v0S -v-13d +%s)$DAYCOLOR \
    VRULE:$(date -v0H -v0M -v0S -v-14d +%s)$DAYCOLOR \
    VRULE:$(date -v0H -v0M -v0S -v-15d +%s)$DAYCOLOR \
    VRULE:$(date -v0H -v0M -v0S -v-16d +%s)$DAYCOLOR \
    VRULE:$(date -v0H -v0M -v0S -v-17d +%s)$DAYCOLOR \
    VRULE:$(date -v0H -v0M -v0S -v-18d +%s)$DAYCOLOR \
    VRULE:$(date -v0H -v0M -v0S -v-19d +%s)$DAYCOLOR \
    VRULE:$(date -v0H -v0M -v0S -v-20d +%s)$DAYCOLOR \
    VRULE:$(date -v0H -v0M -v0S -v-21d +%s)$DAYCOLOR \
    VRULE:$(date -v0H -v0M -v0S -v-22d +%s)$DAYCOLOR \
    VRULE:$(date -v0H -v0M -v0S -v-23d +%s)$DAYCOLOR \
    VRULE:$(date -v0H -v0M -v0S -v-24d +%s)$DAYCOLOR \
    VRULE:$(date -v0H -v0M -v0S -v-25d +%s)$DAYCOLOR \
    VRULE:$(date -v0H -v0M -v0S -v-26d +%s)$DAYCOLOR \
    VRULE:$(date -v0H -v0M -v0S -v-27d +%s)$DAYCOLOR \
    VRULE:$(date -v0H -v0M -v0S -v-28d +%s)$DAYCOLOR \
    VRULE:$(date -v0H -v0M -v0S -v-29d +%s)$DAYCOLOR \
    VRULE:$(date -v0H -v0M -v0S -v-30d +%s)$DAYCOLOR \
    COMMENT:"\\l" > /dev/null

 

rrdtool graph $IMAGEFILE365 \
    -A -w640 -h480 --imgformat=PNG \
    --title="$LABELTEXT (last year) ... $(date)" \
    --vertical-label="Bytes/sec" \
    --start="-365 day" \
    --slope-mode \
    --alt-autoscale-max \
    --x-grid YEAR:1:MONTH:1:MONTH:1:0:"%b" \
    DEF:input=$RRDFILE:input:AVERAGE \
    DEF:output=$RRDFILE:output:AVERAGE \
    LINE1:input$DOWNCOLOR:"download" \
    LINE1:output$UPCOLOR:"upload" \
    COMMENT:"\\l" > /dev/null


# If SELinux is in use, then you may need to authorize the generated
# images to be readable by your webserver.
#chcon -t httpd_sys_content_t $IMAGEFILE3 $IMAGEFILE14


exit 0

