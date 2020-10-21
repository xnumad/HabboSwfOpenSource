package com.sulake.habbo.sound.trax
{
    import com.sulake.core.utils.Map;

    public class TraxData 
    {
        private var _channels:Array;
        private var _metaData:Map;

        public function TraxData(k:String)
        {
            var channelLines:Array;
            var metaDatas:Array;
            var m:int;
            var metaDataKey:String;
            var metaDataValue:String;
            var channelId:int;
            var channelItemSets:Array;
            var channel:TraxChannel;
            var i:int;
            var channelItem:Array;
            var channelItemId:int;
            var channelItemLength:int;
            this._metaData = new Map();
            super();
            this._channels = [];
            var lines:Array = k.split(":");
            var lastLine:String = String(lines[(lines.length - 1)]);
            if (lastLine.indexOf("meta") != -1)
            {
                metaDatas = lastLine.split(";");
                m = 0;
                while (m < metaDatas.length)
                {
                    metaDataKey = String(metaDatas[m]).split(",")[0];
                    metaDataValue = String(metaDatas[m]).split(",")[1];
                    this._metaData.add(metaDataKey, metaDataValue);
                    m++;
                }
                channelLines = lines.slice(0, (lines.length - 1));
            }
            else
            {
                channelLines = lines;
            }
            var c:int;
            while (c < (channelLines.length / 2))
            {
                if (channelLines[(c * 2)].toString().length > 0)
                {
                    channelId = int(channelLines[(c * 2)]);
                    channelItemSets = channelLines[((c * 2) + 1)].toString().split(";");
                    channel = new TraxChannel(channelId);
                    i = 0;
                    while (i < channelItemSets.length)
                    {
                        channelItem = channelItemSets[i].toString().split(",");
                        if (channelItem.length != 2)
                        {
                            Logger.log("Trax load error: invalid song data string");
                            return;
                        }
                        channelItemId = int(channelItem[0]);
                        channelItemLength = int(channelItem[1]);
                        channel.addChannelItem(new TraxChannelItem(channelItemId, channelItemLength));
                        i++;
                    }
                    this._channels.push(channel);
                }
                c++;
            }
        }

        public function get channels():Array
        {
            return this._channels;
        }

        public function getSampleIds():Array
        {
            var _local_3:TraxChannel;
            var _local_4:int;
            var _local_5:TraxChannelItem;
            var k:Array = [];
            var _local_2:int;
            while (_local_2 < this._channels.length)
            {
                _local_3 = (this._channels[_local_2] as TraxChannel);
                _local_4 = 0;
                while (_local_4 < _local_3.itemCount)
                {
                    _local_5 = _local_3.getItem(_local_4);
                    if (k.indexOf(_local_5.id) == -1)
                    {
                        k.push(_local_5.id);
                    }
                    _local_4++;
                }
                _local_2++;
            }
            return k;
        }

        public function get hasMetaData():Boolean
        {
            return !(this._metaData["meta"] == null);
        }

        public function get metaCutMode():Boolean
        {
            return this._metaData["c"] == "1";
        }

        public function get metaTempo():int
        {
            return this._metaData["t"] as int;
        }
    }
}
