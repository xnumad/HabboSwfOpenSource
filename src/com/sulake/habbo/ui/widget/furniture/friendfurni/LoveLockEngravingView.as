package com.sulake.habbo.ui.widget.furniture.friendfurni
{
    import com.sulake.habbo.room.object.data.StringArrayStuffData;

    public class LoveLockEngravingView extends FriendFurniEngravingView 
    {
        public function LoveLockEngravingView(k:FriendFurniEngravingWidget, _arg_2:StringArrayStuffData)
        {
            super(k, _arg_2);
        }

        override protected function assetName():String
        {
            return "lovelock_engraving_xml";
        }
    }
}
