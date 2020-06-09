class Transfer
  attr_accessor :sender, :receiver, :amount, :status

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    if @sender.valid? && @receiver.valid?
      true
    else
      false
    end
  end

  def execute_transaction
    #use @sender. to link with bank account
    if sender.balance < amount
      @status = "rejected" || @sender.status = "closed"
      "Transaction rejected. Please check your account balance."

    elsif @status != "complete" && @sender.valid?
      @receiver.balance += amount
      @sender.balance -= amount
      @status = "complete"
    end
  end

  def reverse_transfer
    if self.valid? && self.status == "complete" && sender.balance > amount
      receiver.balance -= amount
      sender.balance += amount
      self.status = "reversed"
    end
  end

end
