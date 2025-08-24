package caioneves05.terraform_boilerplate.app.controller;

import caioneves05.terraform_boilerplate.app.dtos.TimestampResponse;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.time.Instant;

@RestController
public class ApiController {
    @GetMapping
    public ResponseEntity<TimestampResponse> helloAws() {
        return ResponseEntity.ok(new TimestampResponse(Instant  .now()));
    }
}
