package org.openvideoads.vast.playlist.smil
{
    import org.openvideoads.vast.playlist.DefaultPlaylist;
    import org.openvideoads.vast.schedule.StreamSequence;
    import org.openvideoads.vast.config.groupings.ProvidersConfigGroup;

    public class SMILPlaylist extends DefaultPlaylist 
    {
        public function SMILPlaylist(k:StreamSequence=null, _arg_2:ProvidersConfigGroup=null, _arg_3:ProvidersConfigGroup=null)
        {
            super(k, _arg_2, _arg_3);
        }

        override public function loadFromString(k:String):void
        {
            var _local_2:XML = new XML(k);
            _Str_21786(new _Str_11061(_local_2.children()[0].children()[0].@base.toString(), _local_2.children()[1].children()[0].@src.toString()));
        }

        override public function getModel():Array
        {
            return new Array();
        }

        override public function toString(k:Boolean=false):String
        {
            return new String();
        }
    }
}
