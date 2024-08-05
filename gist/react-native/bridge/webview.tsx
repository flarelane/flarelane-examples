import FlareLane from '@flarelane/react-native-sdk';
import React, { Component } from 'react';
import { View } from 'react-native';
import { WebView } from 'react-native-webview';

export default class App extends Component {
  render() {
    return (
      <View style={{ flex: 1 }}>
        <WebView
          onMessage={(event) => {
            const data = JSON.parse(event.nativeEvent.data);
            switch (data.type) {
              case 'setUserId':
                FlareLane.setUserId({ title: data.userId });
                break;
              case 'setTags':
                FlareLane.setTags({ color: data.tags });
                break;
            }
          }}
        />
      </View>
    );
  }
}
