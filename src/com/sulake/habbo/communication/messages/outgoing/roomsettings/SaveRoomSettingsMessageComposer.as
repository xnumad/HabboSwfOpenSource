package com.sulake.habbo.communication.messages.outgoing.roomsettings
{
    import com.sulake.core.communication.messages.IMessageComposer;
    import com.sulake.core.runtime.IDisposable;

    public class SaveRoomSettingsMessageComposer implements IMessageComposer, IDisposable 
    {
        private var messageArray:Array;

        public function SaveRoomSettingsMessageComposer(k:SaveableRoomSettingsData)
        {
            var tags:Array;
            var _local_3:String;
            var _local_4:String;
            this.messageArray = new Array();
            super();
            this.messageArray.push(k.roomId);
            this.messageArray.push(k.name);
            this.messageArray.push(k.description);
            this.messageArray.push(k.doorMode);
            this.messageArray.push(((k.password !== null) ? k.password : ""));
            this.messageArray.push(k.maximumVisitors);
            this.messageArray.push(k.categoryId);
            if (k.tags)
            {
                tags = [];
                for each (_local_3 in k.tags)
                {
                    if (((_local_3) && (!(_local_3 === ""))))
                    {
                        tags.push(_local_3);
                    }
                }
                this.messageArray.push(tags.length);
                for each (_local_4 in tags)
                {
                    this.messageArray.push(_local_4);
                }
            }
            else
            {
                this.messageArray.push(0);
            }
            this.messageArray.push(k.tradeMode);
            this.messageArray.push(k.allowPets);
            this.messageArray.push(k.allowFoodConsume);
            this.messageArray.push(k.allowWalkThrough);
            this.messageArray.push(k.hideWalls);
            this.messageArray.push(k.wallThickness);
            this.messageArray.push(k.floorThickness);
            this.messageArray.push(k.whoCanMute);
            this.messageArray.push(k.whoCanKick);
            this.messageArray.push(k.whoCanBan);
            this.messageArray.push(k.chatMode);
            this.messageArray.push(k.chatBubbleSize);
            this.messageArray.push(k.chatScrollUpFrequency);
            this.messageArray.push(k.chatFullHearRange);
            this.messageArray.push(k.chatFloodSensitivity);
            this.messageArray.push(k.allowNavigatorDynCats);
        }

        public function getMessageArray():Array
        {
            return this.messageArray;
        }

        public function dispose():void
        {
            this.messageArray = null;
        }

        public function get disposed():Boolean
        {
            return false;
        }
    }
}
