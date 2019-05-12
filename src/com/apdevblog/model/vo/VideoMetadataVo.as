package com.apdevblog.model.vo
{
    public class VideoMetadataVo 
    {
        public var duration:Number;
        public var width:Number;
        public var height:Number;
        public var keyframes:Object;
        public var _Str_19283:Boolean;

        public function VideoMetadataVo(k:Object=null)
        {
            var _local_2:String;
            super();
            if (k != null)
            {
                this.width = k["width"];
                this.height = k["height"];
                this.duration = k["duration"];
                if (k["keyframes"] != null)
                {
                    this._Str_19283 = false;
                    this.keyframes = k["keyframes"];
                }
                else
                {
                    if (k["seekpoints"] != null)
                    {
                        this._Str_19283 = true;
                        this.keyframes = new Object();
                        this.keyframes["times"] = new Array();
                        this.keyframes["filepositions"] = new Array();
                        for (_local_2 in k["seekpoints"])
                        {
                            this.keyframes["times"][_local_2] = (k["seekpoints"][_local_2]["time"] as Number);
                            this.keyframes["filepositions"][_local_2] = (k["seekpoints"][_local_2]["offset"] as Number);
                        }
                    }
                    else
                    {
                        this.keyframes = null;
                    }
                }
            }
        }
    }
}
