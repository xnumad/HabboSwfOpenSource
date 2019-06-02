//com.sulake.habbo.session.handler.RoomUsersHandler

package com.sulake.habbo.session.handler{
    import com.sulake.core.communication.connection.IConnection;
    import com.sulake.habbo.session.IRoomHandlerListener;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.incoming.inventory.pets.ConfirmBreedingRequestEvent;
    import com.sulake.habbo.communication.messages.incoming.inventory.pets.ConfirmBreedingResultEvent;
    import com.sulake.habbo.communication.messages.incoming.inventory.pets.NestBreedingSuccessEvent;
    import com.sulake.habbo.communication.messages.incoming.room.pets.PetPlacingErrorEvent;
    import com.sulake.habbo.communication.messages.incoming.room.bots.BotErrorEvent;
    import com.sulake.habbo.communication.messages.incoming.friendlist.NewFriendRequestEvent;
    import com.sulake.habbo.communication.messages.incoming.room.action.DanceMessageEvent;

    public class RoomUsersHandler extends BaseHandler {

        public function RoomUsersHandler(k:IConnection, _arg_2:IRoomHandlerListener);

        private function onFavoriteMembershipUpdate(k:IMessageEvent):void;

        private function onUsers(k:IMessageEvent):void;

        private function onUserRemove(k:IMessageEvent):void;

        private function onUserBadges(k:IMessageEvent):void;

        private function onDoorbell(k:IMessageEvent):void;

        private function onUserChange(k:IMessageEvent):void;

        private function onUserNameChange(k:IMessageEvent):void;

        private function onPetInfo(k:IMessageEvent):void;

        private function onPetFigureUpdate(k:IMessageEvent):void;

        private function onPetBreedingResult(k:IMessageEvent):void;

        private function onConfirmPetBreeding(k:ConfirmBreedingRequestEvent):void;

        private function onConfirmPetBreedingResult(k:ConfirmBreedingResultEvent):void;

        private function onNestBreedingSuccess(k:NestBreedingSuccessEvent):void;

        private function onPetBreedingEvent(k:IMessageEvent):void;

        private function onPetStatusUpdate(k:IMessageEvent):void;

        private function onPetLevelUpdate(k:IMessageEvent):void;

        private function onEnabledPetCommands(k:IMessageEvent):void;

        private function onPetPlacingError(k:PetPlacingErrorEvent):void;

        private function onBotError(k:BotErrorEvent):void;

        private function onFriendRequest(k:NewFriendRequestEvent):void;

        private function onDance(k:DanceMessageEvent):void;


    }
}//package com.sulake.habbo.session.handler

