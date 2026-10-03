import List from '@ohos.util.List';

@Entry
@Component
struct Index {
  @State message: string = 'Hello World';
  @State balance: number = 0;
  private input: number = 0;
  private history: List<string> = new List();
  private controller: TextInputController = new TextInputController();


  // - 32%
  //

  build() {
    Column() {
      Column() {
        Row() {
          Column() {
            Text('Account Number')
            Text('ACC001') // String
              .fontWeight(FontWeight.Bold)

          }
          .width('50%')
          .margin({ bottom: 10 })

          Image($r('app.media.card'))
            .width(20)
        }
        .width('100%')
        .justifyContent(FlexAlign.SpaceBetween)

        Text('Current Balance')
          .margin({ bottom: 10 })
        Text(`$${this.balance.toFixed(2)}`)
          .margin({ bottom: 10 })
          .fontWeight(FontWeight.Bold)

      }
      .width('100%')
      .margin({ left: 20, right: 20 })
      .backgroundColor('#ffa1dcff')
      .borderRadius(10)
      .margin({ bottom: 10 })

      Column() {
        Text('Enter Account')
      }
      .alignItems(HorizontalAlign.Start)
      .margin({ bottom: 10 })

      TextInput({ controller: this.controller })
        .onChange((input: string) => {
          this.input = Number(input);
        })
        .margin({ bottom: 10 })
        .type(InputType.NUMBER_DECIMAL)
        .textAlign(TextAlign.Center)

      Row() {
        Button('+ Deposit') // + icon
          .onClick(() => {
            this.balance += this.input;
            this.history.add(`D${this.input}}`)
            this.controller.deleteText();
          })
          .borderRadius(5)
          .backgroundColor('#ffa2a2a2')

        Button('- Withdraw')
          .onClick(() => {
            // todo: cannot have neg
            if (this.balance - this.input > 0) {
              this.balance -= this.input;
            }else{
              console.warn(`balance is less than 0 !`)
            }
            this.history.add(`W${this.input}}`);
            this.controller.deleteText();

          })
          .borderRadius(5)
          .backgroundColor('#ffa2a2a2')

      }
      .margin({ bottom: 10 })
      .width('100%')
      .justifyContent(FlexAlign.SpaceBetween)


      Text('Last Transaction')

      Column() {
        // todo: @Builder
        Text('history')
      }
      .width('100%')
      .margin({ left: 20, right: 20 })
      .backgroundColor('#ffcbbdbd')
      .borderRadius(10)
      .margin({ bottom: 10 })

      Button('Transaction History')
        .onClick(()=>{
          // con
        })


      Column()
      Column()

    }
    .alignItems(HorizontalAlign.Start)
    .padding(20)
    .height('100%')
    .width('100%')
  }
}