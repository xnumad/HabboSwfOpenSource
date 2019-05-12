package org.openvideoads.vast.playlist.mrss
{
    import org.openvideoads.vast.playlist.DefaultPlaylist;
    import org.openvideoads.vast.schedule.StreamSequence;
    import org.openvideoads.vast.config.groupings.ProvidersConfigGroup;
    import org.openvideoads.util.Timestamp;
    import org.openvideoads.vast.playlist._Str_3480;

    public class MediaRSSPlaylist extends DefaultPlaylist 
    {
        protected var _Str_1858:String = "Not available";
        protected var _Str_2495:String = "";
        protected var _Str_1676:String = "Not available";

        public function MediaRSSPlaylist(k:StreamSequence=null, _arg_2:ProvidersConfigGroup=null, _arg_3:ProvidersConfigGroup=null)
        {
            super(k, _arg_2, _arg_3);
        }

        override public function loadFromString(k:String):void
        {
            var _local_4:int;
            var _local_5:XML;
            var _local_6:_Str_5739;
            var _local_2:Namespace = new Namespace("http://search.yahoo.com/mrss/");
            XML.ignoreWhitespace = true;
            var _local_3:XML = new XML(k);
            if (_local_3.length() > 0)
            {
                if (_local_3.channel.description != null)
                {
                    this._Str_1858 = _local_3.channel.description.text();
                }
                if (_local_3.channel.title != null)
                {
                    this._Str_2495 = _local_3.channel.title.text();
                }
                if (_local_3.channel.link != null)
                {
                    this._Str_1676 = _local_3.channel.link.text();
                }
                _local_4 = 0;
                while (_local_4 < _local_3.channel.item.length())
                {
                    _local_5 = _local_3.channel.item[_local_4];
                    _local_6 = new _Str_5739();
                    _local_6.description = _local_5.description;
                    _local_6.guid = _local_5.guid;
                    _local_6.link = _local_5.link;
                    _local_6._Str_20606 = _local_5.pubDate;
                    _local_6.url = _local_5._local_2::content.@url;
                    _local_6.mimeType = _local_5._local_2::content.@type;
                    _local_6.filename = _local_5._local_2::title;
                    _local_6.duration = Timestamp._Str_4110(_local_5._local_2::content.@duration);
                    _Str_2519.push(_local_6);
                    _local_4++;
                }
            }
        }

        override public function newPlaylistItem():_Str_3480
        {
            return new _Str_5739();
        }

        override public function getModel():Array
        {
            return new Array();
        }

        override public function toString(k:Boolean=false):String
        {
            var _local_2:String = new String();
            _local_2 = (_local_2 + '<rss version="2.0" xmlns:media="http://search.yahoo.com/mrss/">');
            _local_2 = (_local_2 + "<channel>");
            _local_2 = (_local_2 + (("<description>" + this._Str_1858) + "</description>"));
            _local_2 = (_local_2 + (("<title>" + this._Str_2495) + "</title>"));
            _local_2 = (_local_2 + (("<link>" + this._Str_1676) + "</link>"));
            var _local_3:int;
            while (_local_3 < _Str_2519.length)
            {
                _local_2 = (_local_2 + _Str_2519[_local_3].toString(k));
                _local_3++;
            }
            _local_2 = (_local_2 + "</channel>");
            _local_2 = (_local_2 + "</rss>");
            return _local_2;
        }
    }
}
