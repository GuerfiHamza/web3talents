// This file is auto-generated by ./bin/rails stimulus:manifest:update
// Run that command whenever you add a new controller or create them with
// ./bin/rails generate stimulus controllerName

import { application } from "./application"

import ChatroomSubscriptionController from "./chatroom_subscription_controller"
application.register("chatroom-subscription", ChatroomSubscriptionController)

import HelloController from "./hello_controller"
application.register("hello", HelloController)

import PhotoPreviewController from "./photo_preview_controller"
application.register("photo-preview", PhotoPreviewController)

import SessionsController from "./sessions_controller"
application.register("sessions", SessionsController)

import Notification from 'stimulus-notification'
application.register('notification', Notification)

import { Modal } from "tailwindcss-stimulus-components"
application.register('modal', Modal)
import Autosave from 'stimulus-rails-autosave'
application.register('autosave', Autosave)
import TextareaAutogrow from 'stimulus-textarea-autogrow'
application.register('textarea-autogrow', TextareaAutogrow)

import { Dropdown } from "tailwindcss-stimulus-components"
application.register('dropdown', Dropdown)

console.log("Hello from StimulusJS")
