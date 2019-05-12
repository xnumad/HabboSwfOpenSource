package org.openvideoads.vast.model
{
    import org.openvideoads.util.NetworkResource;

    public class Impression extends NetworkResource 
    {
        public function Impression(k:String, _arg_2:String)
        {
            super(k, _arg_2);
        }

        public function unload():void
        {
            super.close();
        }

        override public function toJSObject():Object
        {
            var k:Object = super.toJSObject();
            k.eventType = "impression";
            return k;
        }
    }
}
