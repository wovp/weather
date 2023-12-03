import formInfo from '@ohos.app.form.formInfo';
import formBindingData from '@ohos.app.form.formBindingData';
import FormExtensionAbility from '@ohos.app.form.FormExtensionAbility';
import weatherData from '../model/weatherData'

export default class EntryFormAbility extends FormExtensionAbility {
  weatherHost: string = 'https://ali-weather.showapi.com'
  weatherPath: string = '/area-to-weather'
  onAddForm(want) {
    // Called to return a FormBindingData object.
    return formBindingData.createFormBindingData('tt');
  }

  onCastToNormalForm(formId) {
    // Called when the form provider is notified that a temporary form is successfully
    // converted to a normal form.
  }

  onUpdateForm(formId) {
    // Called to notify the form provider to update a specified form.
  }

  onChangeFormVisibility(newStatus) {
    // Called when the form provider receives form events from the system.
  }

  onFormEvent(formId, message) {
    // Called when a specified message event defined by the form provider is triggered.
  }

  onRemoveForm(formId) {
    // Called to notify the form provider that a specified form has been destroyed.
  }

  onAcquireFormState(want) {
    // Called to return a {@link FormState} object.
    return formInfo.FormState.READY;
  }
};