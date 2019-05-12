package org.openvideoads.vast.playlist.mrss
{
    import org.openvideoads.vast.playlist.DefaultPlaylistItem;
    import org.openvideoads.util.Timestamp;

    public class _Str_5739 extends DefaultPlaylistItem 
    {


        override public function toString(k:Boolean=false):String
        {
            var _local_2:String = new String();
            _local_2 = (_local_2 + "<item>");
            _local_2 = (_local_2 + (("<title>" + title) + "</title>"));
            _local_2 = (_local_2 + (("<link>" + link) + "</link>"));
            _local_2 = (_local_2 + (("<description>" + description) + "</description>"));
            _local_2 = (_local_2 + (("<guid>" + guid) + "</guid>"));
            _local_2 = (_local_2 + (((((('<media:content url="' + url) + '" duration="') + Timestamp.timestampToSeconds(duration)) + '" type="') + mimeType) + '"/>'));
            _local_2 = (_local_2 + (("<media:title>" + filename) + "</media:title>"));
            _local_2 = (_local_2 + (('<media:credit role="author">' + _Str_17397()) + "</media:credit>"));
            _local_2 = (_local_2 + "</item>");
            return _local_2;
        }
    }
}
